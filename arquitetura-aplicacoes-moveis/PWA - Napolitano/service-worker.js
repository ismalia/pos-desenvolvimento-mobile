'use strict';

const CACHE_NAME = 'napolitano-static';

const FILES_TO_CACHE = [

    'favicon.ico',
    'images/logo.png',
    'images/bg.jpg',
    'images/offline.png',
    'images/50_sabores_300x300.png',
    'images/bellucci_300x300.png',
    'images/pardal_300x300.png',
    'images/san_paolo-300x300.png',
    'images/sorvete_juarez-300x300.png',
    'css/styles.css',
    'css/bootstrap.min.css',
    'css/bootstrap.min.css.map',
    'js/bootstrap.bundle.min.js',
    'js/bootstrap.bundle.min.js.map',
    'offline.html'

];

//Instala o service worker no browser
self.addEventListener('install', (evt) => {
    console.log('[ServiceWorker] Instalando...');
    evt.waitUntil(caches.open(CACHE_NAME).then((cache) => {
        console.log('[ServiceWorker] Fazendo cache dos arquivos da aplicação');
        return cache.addAll(FILES_TO_CACHE);
    }));
    self.skipWaiting();
});

//Gera o cache dos arquivos estáticos
self.addEventListener('activate', (evt) => {
    console.log('[ServiceWorker] Ativando...');
    evt.waitUntil(caches.keys().then((keylist) => {
        return Promise.all(keylist.map((key) => {
            console.log('[ServiceWorker] Removendo cache antigo...');
            if (key !== CACHE_NAME) {
                return caches.delete(key);
            }
        }));
    }));
    self.clients.claim();
});

//Responder a versão offline do app
self.addEventListener('fetch', (evt) => {
    console.log('[ServiceWorker] Recebendo', evt.request.url);

    if (evt.request.mode !== 'navigate') {
        return;
    }

    evt.respondWith(fetch(evt.request).catch(() => {
        return caches.open(CACHE_NAME).then((cache) => {
            return cache.match('offline.html');
        });
    }));
});
