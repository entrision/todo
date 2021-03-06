// Import and register all your controllers from the importmap under controllers/*
import StimulusReflex from "stimulus_reflex"; // <-- add this
import { application } from "./application";
import { cable } from "@hotwired/turbo-rails";
import * as Futurism from "@stimulus_reflex/futurism";

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application);


// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
const consumer = await cable.getConsumer()
application.consumer = consumer
StimulusReflex.initialize(application, { debug: true });
Futurism.initializeElements()
Futurism.createSubscription(consumer)
