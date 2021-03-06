package de.dittner.async {
public interface IAsyncOperation {
	function addCompleteCallback(handler:Function):void;
	function dispatchSuccess(result:* = null):void;
	function dispatchError(error:* = null):void;
	function dispatchCancel():void;

	function get isSuccess():Boolean;
	function get isTimeout():Boolean;
	function get isProcessing():Boolean;
	function get isCanceled():Boolean;
	function get error():*;
	function get result():*;
	function get uid():Number;

	function get timeoutInSec():Number;
	function set timeoutInSec(value:Number):void;
}
}
