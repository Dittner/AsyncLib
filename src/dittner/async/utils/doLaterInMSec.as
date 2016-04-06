package dittner.async.utils {
import dittner.async.AsyncCallbacksLib;

public function doLaterInMSec(method:Function, delayMilliSec:uint = 1000):int {
	return FTimer.execFunc(method, Math.ceil(delayMilliSec / 1000 * AsyncCallbacksLib.fps));
}
}