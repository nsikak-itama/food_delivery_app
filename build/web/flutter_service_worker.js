'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bcc131b3ddba913e23391a0cc1360f16",
"assets/AssetManifest.bin.json": "8e1493119c3557efdbfacbac9d8192e2",
"assets/AssetManifest.json": "7f6f7b7544d26a830817d6797fa33d6a",
"assets/assets/images/burgers/aloha_burer.png": "4326562ede3eba9b225e3c9515b33f74",
"assets/assets/images/burgers/bbq_burger.png": "e301ac9a04c363951c6fe7a1cd5e587e",
"assets/assets/images/burgers/bluemoon_burger.png": "e82ff27344f955a21ce62965a4e5b369",
"assets/assets/images/burgers/cheese_burger.png": "21cd8cffa8093248a7b990b57939f0d1",
"assets/assets/images/burgers/vege.png": "9afb10c93e674ad96638770fed11d834",
"assets/assets/images/desserts/applepie.png": "0d533aa9db181f04e1fe3e01e173e999",
"assets/assets/images/desserts/brownies.png": "d8049563b18424774e0f2d6bac36414e",
"assets/assets/images/desserts/cheesecake.png": "0a06c5d76e65098a9d927161b93b25a3",
"assets/assets/images/desserts/chocolate_cake.png": "700c2a8ce3cd12bfc296e6b6c4a9d712",
"assets/assets/images/desserts/vanilla_ice_cream.png": "44775192230dbfda4674a361237f2382",
"assets/assets/images/drinks/iced_tea.png": "553b810fd3c84c9b75d6671cafc62cd5",
"assets/assets/images/drinks/lemonade.png": "c5abce4c27bcd3a534a2f14804a3d645",
"assets/assets/images/drinks/mango_smoothie.png": "af82ad4a6702cdb5f712c042465adbb8",
"assets/assets/images/drinks/orange%2520juice.png": "51cba44f6b2503cf0f179e404660e0a9",
"assets/assets/images/salad/caesar_salad.png": "b8bfb220fae3741c7c666e85f0acf69c",
"assets/assets/images/salad/cobbsalad.png": "27f1132a1df07c5ecce1a2a634b50f10",
"assets/assets/images/salad/garden_salad.png": "8267bcdcc393a8842ce99238ca3ca075",
"assets/assets/images/salad/greek_salad.png": "31cd77db5a45581811536b9ef88cd4e5",
"assets/assets/images/salad/pasta_salad.png": "390627d62cd6486368a7a539b54597c2",
"assets/assets/images/sides/coleslaw.png": "bf284c9d61a7531828d14f32dd0bd4b6",
"assets/assets/images/sides/french_fries.png": "c7ad393f91e5c0c866b27a16f8f52257",
"assets/assets/images/sides/garlic_bread.png": "b96122d147be794826787607450ae162",
"assets/assets/images/sides/mashed_potatoes.png": "ceb5ac25217df4bcb37b9bbf3e05b6f5",
"assets/assets/images/sides/onion_rings.png": "a337165e74968d53b0563f647888fade",
"assets/FontManifest.json": "d0975c94afeb32ec4155750ce2543f5e",
"assets/fonts/MaterialIcons-Regular.otf": "a9b678938c86cbacaa807e5f71c47e69",
"assets/NOTICES": "0c682c155b6bd17501fe1e7dcebc6cdf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_credit_card/font/halter.ttf": "4e081134892cd40793ffe67fdc3bed4e",
"assets/packages/flutter_credit_card/icons/amex.png": "f75cabd609ccde52dfc6eef7b515c547",
"assets/packages/flutter_credit_card/icons/chip.png": "5728d5ac34dbb1feac78ebfded493d69",
"assets/packages/flutter_credit_card/icons/discover.png": "62ea19837dd4902e0ae26249afe36f94",
"assets/packages/flutter_credit_card/icons/elo.png": "ffd639816704b9f20b73815590c67791",
"assets/packages/flutter_credit_card/icons/hipercard.png": "921660ec64a89da50a7c82e89d56bac9",
"assets/packages/flutter_credit_card/icons/mastercard.png": "7e386dc6c169e7164bd6f88bffb733c7",
"assets/packages/flutter_credit_card/icons/mir.png": "c87d1479c2784a534751238167b254b5",
"assets/packages/flutter_credit_card/icons/rupay.png": "a10fbeeae8d386ee3623e6160133b8a8",
"assets/packages/flutter_credit_card/icons/unionpay.png": "87176915b4abdb3fcc138d23e4c8a58a",
"assets/packages/flutter_credit_card/icons/visa.png": "f6301ad368219611958eff9bb815abfe",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "4aad6abff419f86489d4c042207c4501",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "42af579c7265646aca06a68e4334f26a",
"/": "42af579c7265646aca06a68e4334f26a",
"main.dart.js": "0133153f32ac14a3b44a547cd85b480d",
"manifest.json": "848e20f722707125ac8b64e5081adc85",
"version.json": "f9a9ae135c39399785f34b2ea788e23b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
