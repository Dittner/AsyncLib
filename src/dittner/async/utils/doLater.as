package dittner.async.utils {
import dittner.async.Async;

public function doLater(method:Function, delayMSec:int = 50):Number {
	return FTimer.execFunc(method, Math.ceil(Async.fps * delayMSec / 1000));
}
}