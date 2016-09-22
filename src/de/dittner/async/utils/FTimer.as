package de.dittner.async.utils {
public class FTimer {
	public function FTimer() {}

	//----------------------------------------------------------------------------------------------
	//
	//  Variables
	//
	//----------------------------------------------------------------------------------------------

	private var timer:FrameTimer;
	private var index:Number = 0;
	private var funcHash:Object = {};//[funcIndex] = func
	private var funcTimeLine:Object = {};//[frameNumber] = funcIndex
	private var totalFrames:uint = 0;

	//----------------------------------------------------------------------------------------------
	//
	//  Methods
	//
	//----------------------------------------------------------------------------------------------

	private static var instance:FTimer = new FTimer();
	public static function execFunc(testFunc:Function, delayFrames:int):int {
		return instance.add(testFunc, delayFrames);
	}

	private function add(func:Function, delayFrames:int):Number {
		if (!timer) {
			timer = new FrameTimer(2, timerHandler);
			timer.start();
		}
		funcHash[++index] = func;

		if (!funcTimeLine[delayFrames + totalFrames])
			funcTimeLine[delayFrames + totalFrames] = index;
		else if (funcTimeLine[delayFrames + totalFrames] is Number) {
			var curInd:Number = funcTimeLine[delayFrames + totalFrames];
			funcTimeLine[delayFrames + totalFrames] = [curInd, index];
		}
		else if (funcTimeLine[delayFrames + totalFrames] is Array) {
			funcTimeLine[delayFrames + totalFrames].push(index);
		}

		return index;
	}

	private function timerHandler():void {
		totalFrames++;
		if (funcTimeLine[totalFrames]) {
			if (funcTimeLine[totalFrames] is Number) {
				var ind:Number = funcTimeLine[totalFrames];
				if (funcHash[ind] is Function) funcHash[ind]();
			}
			else if (funcTimeLine[totalFrames] is Array) {
				var functionIndexes:Array = funcTimeLine[totalFrames];
				for each(var funcInd:int in functionIndexes)
					if (funcHash[funcInd] is Function) funcHash[funcInd]();

				functionIndexes.length = 0;
			}

			delete funcTimeLine[totalFrames];
		}
		timer.start();
	}

	public static function abortFunc(funcInd:int):void {
		instance.abort(funcInd);
	}

	private function abort(funcInd:int):void {
		delete funcHash[funcInd];
	}

}
}
