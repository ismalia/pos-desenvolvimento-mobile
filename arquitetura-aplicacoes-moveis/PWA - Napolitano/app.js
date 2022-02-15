let deferredInstallPrompt = null;
const installButton = document.getElementById('installButton');

let initializeUI = function() {
  installButton.removeAttribute('hidden');
  installButton.addEventListener('click', function() {
    deferredInstallPrompt.prompt();

    deferredInstallPrompt.userChoice.then((choice) => {
      if (choice.outcome === 'accepted') {
        console.log("Usuário aceitou a instalação.");
      }
      else {
        console.log("Usuário não aceitou a instalação.");
      }
    });
  });
}

window.addEventListener('beforeinstallprompt', savePrompt);
window.addEventListener('appinstalled', async function(e) {
  installButton.style.display = "none"
});

function savePrompt(evt) {
  deferredInstallPrompt = evt;
}

var ajax = new XMLHttpRequest();

ajax.open("GET", "./data.json", true);
ajax.send();

ajax.onreadystatechange = function() {
  if (ajax.readyState == 4 && ajax.status == 200) {
    var response = ajax.responseText;
    var jsonData = JSON.parse(response);
    var content = document.getElementById('content_result');

    if (jsonData.length == 0) {
        content.innerHTML = '<div class="row"><div class="col-12"><div class="alert alert-danger" role="alert">Nenhuma sorveteria cadastrada.</div></div></div>';
    }
    else {
        content.innerHTML = "";

        var htmlContent = "";

        for (var i = 0; i < jsonData.length; i++) {
            htmlContent += iceCreamShopCard(jsonData[i].name, jsonData[i].url, jsonData[i].address);
        }

        content.innerHTML = htmlContent;
        cacheCards(jsonData);
    }
  }
}

var iceCreamShopCard = function(name, image, address) {
    return '<div class="ice_cream_shop_card">' +
             '<div class="card w-100 p-4">' +
               '<div class="row justify-content-center">' +
                 '<div class="col-4">' +
                   '<div class="ice_cream_shop_image">' +
                     '<img src="' + image + '" alt="Logo da sorveteria" />' +
                   '</div>' +
                 '</div>' +
                 '<div class="col">' +
                   '<div class="ice_cream_shop_name">' +
                     '<h5 class="card-title">' + name + '</h5>' +
                   '</div>' +
                   '<div class="ice_cream_shop_address">' +
                     '<span><small class="text-muted">' + address + '</small></span>' +
                   '</div>' +
                   '<div class="d-grid col-12 pt-3">' +
                     '<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#iceCreamModal">Ver sorvetes</button>' +
                   '</div>' +
                 '</div>' +
               '</div>' +
             '</div>' +
           '</div>';
}

//Cache conteúdo dinâmico
var cacheCards = function(jsonData) {
  if ('caches' in window) {
    caches.delete('napolitano-dynamic').then(function() {
      console.log('Deletando cache de conteúdo antigo.');
      
      if (jsonData.length > 0) {
        var files = ['data.json'];
        
        for (var i = 0; i < jsonData.length; i++) {
          if (files.indexOf(jsonData[i].url) == -1){
            files.push(jsonData[i].url);
          }
        }
      }

      console.log("Arquivos a serem gravados em cache:");
      console.log(files);

      caches.open('napolitano-dynamic').then(function(cache) {
        cache.addAll(files).then(function() {
          console.log("Arquivos de conteúdo cacheados.");
        });
      });
    });
  }
}
