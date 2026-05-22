/* H&H Law - minimal site behaviour (mobile menu + FAQ accordion) */
function toggleMob(){
  var m = document.getElementById('mob-menu');
  if(!m) return;
  var open = m.classList.toggle('open');
  var ham = document.querySelector('.ham');
  if(ham) ham.setAttribute('aria-expanded', open ? 'true' : 'false');
  document.body.style.overflow = open ? 'hidden' : '';
}
function faq(btn){
  var item = btn.closest('.fi');
  if(!item) return;
  var isOpen = item.classList.contains('open');
  item.closest('.faq-list').querySelectorAll('.fi').forEach(function(i){
    i.classList.remove('open');
  });
  if(!isOpen) item.classList.add('open');
}
