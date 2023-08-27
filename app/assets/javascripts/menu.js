// app/assets/javascripts/menu.js

document.addEventListener('DOMContentLoaded', function() {
  const categoryLinks = document.querySelectorAll('.category-link');
  const menuItemsContainer = document.getElementById('menu-items');

  categoryLinks.forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const categoryId = link.getAttribute('data-category-id');
      
      fetch(`/category/${categoryId}`, { method: 'GET' })
        .then(response => response.text())
        .then(data => {
          menuItemsContainer.innerHTML = data;
        });
    });
  });
});
