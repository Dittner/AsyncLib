package de.dittner.async.utils {
public class Observer {
	public function Observer() {}

	private var listenerCallbackQueue:Array = [];
	public function addListener(handler:Function):void {
		listenerCallbackQueue.push(handler);
	}

	public function removeListener(handler:Function):void {
		for (var i:int = 0; i < listenerCallbackQueue.length - 1; i++)
			if (listenerCallbackQueue[i] == handler) {
				listenerCallbackQueue.splice(i, 1);
				break;
			}
	}

	public function notify(data:*):void {
		for each(var handler:Function in listenerCallbackQueue)
			handler(data);
	}
}
}
