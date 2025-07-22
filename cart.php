<?php
@include 'config.php';
session_start();

$user_id = $_SESSION['user_id'];
if (!isset($user_id)) header('location:login.php');

// Delete a single item
if (isset($_GET['delete'])) {
   $delete_id = $_GET['delete'];
   $conn->prepare("DELETE FROM `cart` WHERE id = ?")->execute([$delete_id]);
   exit(header('location:cart.php'));
}

// Delete all cart items
if (isset($_GET['delete_all'])) {
   $conn->prepare("DELETE FROM `cart` WHERE user_id = ?")->execute([$user_id]);
   unset($_SESSION['promo_code']);
   unset($_SESSION['discount_percent']);
   exit(header('location:cart.php'));
}

// Update quantity
if (isset($_POST['update_qty'])) {
   $cart_id = $_POST['cart_id'];
   $p_qty = filter_var($_POST['p_qty'], FILTER_SANITIZE_STRING);
   $conn->prepare("UPDATE `cart` SET quantity = ? WHERE id = ?")->execute([$p_qty, $cart_id]);
}

// Promo code logic
$discount_percent = 0;
if (isset($_POST['apply_promo'])) {
   $promo_code = strtoupper(trim($_POST['promo_code']));
   $valid_promos = ['SAVE10' => 10, 'OFF20' => 20, 'VEGGIE30' => 30];

   if (array_key_exists($promo_code, $valid_promos)) {
      $_SESSION['promo_code'] = $promo_code;
      $_SESSION['discount_percent'] = $valid_promos[$promo_code];
      $message[] = "Promo code '$promo_code' applied!";
   } else {
      unset($_SESSION['promo_code']);
      unset($_SESSION['discount_percent']);
      $message[] = "Invalid promo code!";
   }
}

if (isset($_GET['remove_promo'])) {
   unset($_SESSION['promo_code']);
   unset($_SESSION['discount_percent']);
   header('Location: cart.php');
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Shopping Cart</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/home.css">
   <link rel="stylesheet" href="css/cart.css?v=1.5">
 

</head>
<body>

<?php include 'header.php'; ?>

<!-- HTML Part (place inside your <body>) -->

<section class="shopping-cart">
   <div class="box-container">
   <?php
      $grand_total = 0;
      $select_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
      $select_cart->execute([$user_id]);
      if($select_cart->rowCount() > 0){
         while($fetch_cart = $select_cart->fetch(PDO::FETCH_ASSOC)){
            $sub_total = $fetch_cart['price'] * $fetch_cart['quantity'];
            $grand_total += $sub_total;
   ?>
   <form method="POST" class="box" data-id="<?= $fetch_cart['id']; ?>">
      <button type="button" class="fas fa-times delete-btn"></button>
      <a href="view_page.php?pid=<?= $fetch_cart['pid']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_cart['image']; ?>" alt="">
      <div class="name"><?= $fetch_cart['name']; ?></div>
      <div class="price">৳<?= $fetch_cart['price']; ?>/-</div>
      <input type="hidden" name="cart_id" value="<?= $fetch_cart['id']; ?>">
      <div class="quantity-wrapper">
         <button type="button" class="qty-btn minus">–</button>
         <input type="number" name="p_qty" value="<?= $fetch_cart['quantity']; ?>" class="qty-input" readonly>
         <button type="button" class="qty-btn plus">+</button>
      </div>
      <input type="submit" value="update" name="update_qty" class="option-btn" style="margin-top:10px;">
      <div class="sub-total">Sub Total: <span>৳<?= $sub_total; ?>/-</span></div>
   </form>
   <?php } } else { echo '<p class="empty">Your cart is empty</p>'; } ?>
   </div>

   <div class="cart-summary">
      <h3>Cart Summary</h3>
      <p>Total Items: <?= $select_cart->rowCount(); ?></p>

      <?php if (!empty($_SESSION['discount_percent'])): ?>
         <?php
            $discount_percent = $_SESSION['discount_percent'];
            $discount_amount = $grand_total * ($discount_percent / 100);
            $grand_total -= $discount_amount;
         ?>
         <p>Promo Applied: <strong><?= $_SESSION['promo_code']; ?></strong> (<?= $discount_percent; ?>% Off)</p>
         <p>Discount: -৳<?= number_format($discount_amount, 2); ?>/-</p>
         <p><a href="cart.php?remove_promo" class="delete-btn" style="font-size: 0.9rem;">Remove Promo</a></p>
      <?php endif; ?>

      <p>Grand Total: ৳<?= number_format($grand_total, 2); ?>/-</p>

      <div class="promo-wrapper">
         <button type="button" class="promo-toggle" onclick="togglePromo()">▼ Have a special code?</button>
         <form method="POST" class="promo-form" style="display: none;">
            <input type="text" name="promo_code" placeholder="Referral/Discount Code" class="promo-input" required>
            <button type="submit" name="apply_promo" class="promo-go">Go</button>
            <button type="button" class="promo-close" onclick="togglePromo()">Close</button>
         </form>
      </div>

      <a href="shop.php" class="option-btn">← Continue Shopping</a>
      <a href="cart.php?delete_all" class="delete-btn <?= ($grand_total > 0)?'':'disabled'; ?>">Delete All</a>
      <a href="checkout.php" class="btn <?= ($grand_total > 0)?'':'disabled'; ?>">Checkout</a>
   </div>


</section>

<script>
document.querySelectorAll('.box').forEach(box => {
   const qtyInput = box.querySelector('.qty-input');
   const plusBtn = box.querySelector('.plus');
   const minusBtn = box.querySelector('.minus');
   const cartId = box.dataset.id;
   const subTotalEl = box.querySelector('.sub-total span');
   const price = parseFloat(box.querySelector('.price').textContent.replace(/[^\d.]/g, ''));

   const updateQtyAjax = (qty) => {
      fetch('update_cart_ajax.php', {
         method: 'POST',
         headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
         body: `cart_id=${cartId}&new_qty=${qty}`
      })
      .then(res => res.json())
      .then(data => {
         if (data.success) {
            subTotalEl.textContent = `৳${(price * qty).toFixed(2)}/-`;
            showSnackbar("Quantity updated");
         }
      });
   };

   plusBtn.onclick = () => {
      let qty = parseInt(qtyInput.value);
      qtyInput.value = ++qty;
      updateQtyAjax(qty);
   };

   minusBtn.onclick = () => {
      let qty = parseInt(qtyInput.value);
      if (qty > 1) {
         qtyInput.value = --qty;
         updateQtyAjax(qty);
      }
   };

   box.querySelector('.delete-btn').onclick = () => {
      box.style.transition = 'opacity 0.5s ease';
      box.style.opacity = 0;
      showUndoSnackbar(cartId, box);
   };
});

function showSnackbar(message) {
   const div = document.createElement("div");
   div.textContent = message;
   div.style.cssText = `
      position: fixed;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
      background: #4CAF50;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      z-index: 9999;
   `;
   document.body.appendChild(div);
   setTimeout(() => div.remove(), 2000);
}

function togglePromo() {
   const form = document.querySelector('.promo-form');
   form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'flex' : 'none';
}

function showUndoSnackbar(id, item) {
   const bar = document.createElement("div");
   bar.innerHTML = `Item removed <button id="undo-btn">Undo</button>`;
   bar.style.cssText = `
      position: fixed;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
      background: #e74c3c;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      z-index: 9999;
   `;
   document.body.appendChild(bar);

   let undo = false;
   document.getElementById("undo-btn").onclick = () => {
      undo = true;
      item.style.opacity = 1;
      bar.remove();
   };

   setTimeout(() => {
      if (!undo) location.href = `cart.php?delete=${id}`;
      else item.style.opacity = 1;
      bar.remove();
   }, 3000);
}
</script>

</body>
</html>
