package de.dittner.async.utils {
import de.dittner.async.AsyncCallbacksLib;

public function doLaterInMSec(method:Function, delayMilliSec:uint = 1000):Number {
	return FTimer.execFunc(method, Math.ceil(delayMilliSec / 1000 * AsyncCallbacksLib.fps));
}
}