package dittner.async.utils {
import dittner.async.Async;

public function doLaterInSec(method:Function, delaySec:uint = 1):Number {
	return FTimer.execFunc(method, Math.ceil(delaySec * Async.fps));
}
}