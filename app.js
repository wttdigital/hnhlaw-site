/* H&H Law - minimal site behaviour (mobile menu + FAQ accordion + consultation form) */
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

/* Consultation form — AJAX submission via Formspree */
(function(){
  var form = document.getElementById('consult-form');
  if(!form) return;
  form.addEventListener('submit', function(e){
    e.preventDefault();
    var btn  = document.getElementById('cf-submit');
    var ok   = document.getElementById('cf-success');
    var err  = document.getElementById('cf-error');
    ok.style.display  = 'none';
    err.style.display = 'none';
    btn.disabled      = true;
    btn.textContent   = 'Sending…';
    fetch(form.action, {
      method:  'POST',
      body:    new FormData(form),
      headers: { 'Accept': 'application/json' }
    }).then(function(r){
      if(r.ok){
        ok.style.display = 'block';
        form.reset();
        btn.textContent = 'Sent ✓';
      } else {
        err.style.display = 'block';
        btn.disabled    = false;
        btn.textContent = 'Submit Consultation Request';
      }
    }).catch(function(){
      err.style.display = 'block';
      btn.disabled    = false;
      btn.textContent = 'Submit Consultation Request';
    });
  });
})();
