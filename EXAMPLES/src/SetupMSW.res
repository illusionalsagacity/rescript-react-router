let settingsHandler = MSW.Http.get(#URL("/api/settings"), async _options => {
  MSW.HttpResponse.jsonObj({"hello": "from msw"}, {status: 200})
})

let worker = MSW.setupWorkerWithHandlers([settingsHandler])

let promise =
  worker->MSW.ServiceWorker.startWithOptions({onUnhandledRequest: #bypass, waitUntilReady: true})
await promise
