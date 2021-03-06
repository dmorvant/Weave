/* ***** BEGIN LICENSE BLOCK *****
 *
 * This file is part of Weave.
 *
 * The Initial Developer of Weave is the Institute for Visualization
 * and Perception Research at the University of Massachusetts Lowell.
 * Portions created by the Initial Developer are Copyright (C) 2008-2015
 * the Initial Developer. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 * 
 * ***** END LICENSE BLOCK ***** */

package weave.api.ui
{
	/**
	 * This is an interface for a collaboration cursor manager, which is in charge of rendering collaboration mouse cursors.
	 * After any change in the property of a cursor, if nothing occurs after a set amount of time (for example, 5000 milliseconds),
	 * the cursor should fade out of view so it does not clutter the display.  The next time the position of that cursor is updated,
	 * the cursor should fade back into view quickly during the move animation.
	 * 
	 * @author adufilie
	 */
	public interface ICollabCursorManager
	{
		/**
		 * This is a list of all existing cursor ids.
		 * @return An Array of mouse cursor ids.
		 */
		function getCursorIds():Array;
		
		/**
		 * This will set the visibility of a mouse cursor so that it smoothly fades in or out of view using alpha values.
		 * @param id Identifies a mouse cursor. If the cursor doesn't exist, it will be created.
		 * @param visible Set to true if the mouse should become visible, or false if it should become invisible.
		 * @param duration The duration of the visibility transition, in milliseconds.
		 */
		function setVisible(id:String, visible:Boolean, duration:uint = 1000):void;

		/**
		 * Set the coordinates of a specific mouse cursor.
		 * The cursor should animate between the previous and new positions.
		 * @param id Identifies a mouse cursor. If the cursor doesn't exist, it will be created.
		 * @param x The new X position
		 * @param y The new Y position
		 * @param duration The duration of the movement animation, in milliseconds.
		 */
		function setPosition(id:String, x:Number, y:Number, duration:uint):void;
		
		/**
		 * Set the color of a specific mouse cursor.
		 * @param id Identifies a mouse cursor. If the cursor doesn't exist, it will be created.
		 * @param color The new color of the cursor
		 * @param duration The duration of the color change effect, in milliseconds.
		 */
		function setColor(id:String, color:uint, duration:uint = 1000):void;
		
		/**
		 * Remove a specific mouse cursor immediately so it no longer appears on the screen or in the list of cursor ids.
		 * @param id Identifies a cursor. If the cursor doesn't exist, this function has no effect.
		 */		
		function removeCursor(id:String):void;
	}
}