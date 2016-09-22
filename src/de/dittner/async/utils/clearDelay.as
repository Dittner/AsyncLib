package de.dittner.async.utils {

public function clearDelay(index:int):void {
	FTimer.abortFunc(index);
}
}