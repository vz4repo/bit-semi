const toggleBtn = document.querySelector('.navbar_toggle');
const menu = document.querySelector('.navbar_menu');
const users = document.querySelector('.navbar_user');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    users.classList.toggle('active');
});
