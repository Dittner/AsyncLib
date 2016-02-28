package dittner.async.utils {
import dittner.async.Async;

import flash.events.Event;
import flash.events.EventDispatcher;

public class FrameTimer extends EventDispatcher {
	public function FrameTimer(delayFrames:uint, callbackFunc:Function) {
		super();
		this.delayFrames = delayFrames == 0 ? 1 : delayFrames;
		completeFunc = callbackFunc;
		if (completeFunc == null) throw new Error("callbackFunc == null!");
		if (!Async.stage) throw new Error("Set at first stage using by Async class")
	}

	//----------------------------------------------------------------------------------------------
	//
	//  Variables
	//
	//----------------------------------------------------------------------------------------------

	private var delayFrames:uint;
	private var completeFunc:Function;
	private var wentFrames:uint = 0;

	//----------------------------------------------------------------------------------------------
	//
	//  Properties
	//
	//----------------------------------------------------------------------------------------------

	//--------------------------------------
	//  running
	//--------------------------------------
	private var _running:Boolean = false;
	public function get running():Boolean {return _running;}
	private function setRunning(value:Boolean):void {
		if (_running != value) {
			_running = value;
		}
	}

	//----------------------------------------------------------------------------------------------
	//
	//  Methods
	//
	//----------------------------------------------------------------------------------------------

	public function reset():void {
		wentFrames = 0;
	}

	public function start():void {
		if (!running) {
			setRunning(true);
			Async.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}

	public function stop():void {
		if (running) {
			setRunning(false);
			wentFrames = 0;
			Async.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}

	private function enterFrameHandler(event:Event):void {
		wentFrames++;
		if (wentFrames >= delayFrames) {
			setRunning(false);
			Async.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			wentFrames = 0;
			completeFunc();
		}
	}
}
}
