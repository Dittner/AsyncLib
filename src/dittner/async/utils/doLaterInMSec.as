package dittner.async.utils {
import dittner.async.Async;

public function doLaterInMSec(method:Function, delayMilliSec:uint = 1000):int {
	return FTimer.execFunc(method, Math.ceil(delayMilliSec / 1000 * Async.fps));
}
}