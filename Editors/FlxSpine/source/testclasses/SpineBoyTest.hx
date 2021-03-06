package  testclasses;
import flixel.FlxG;
import flixel.addons.editors.spine.FlxSpine;
import spinehaxe.SkeletonData;

/**
 * ...
 * @author Kris
 */
class SpineBoyTest extends FlxSpine
{

	public function new(skeletonData:SkeletonData,  X:Float = 0, Y:Float = 0) 
	{
		super(skeletonData, X, Y);
		
		stateData.setMixByName("walk", "jump", 0.2);
		stateData.setMixByName("jump", "walk", 0.4);
		stateData.setMixByName("jump", "jump", 0.2);
		
		state.setAnimationByName(0, "walk", true);
	}
	
	override public function update(elapsed:Float):Void
	{
		var anim = state.getCurrent(0);
		
		if (anim.toString() == "walk") 
		{
			// After one second, change the current animation. Mixing is done by AnimationState for you.
			if (anim.time > 2) 
				state.setAnimationByName(0, "jump", false);
		} 
		else 
		{
			if (anim.time > 1) 
				state.setAnimationByName(0, "walk", true);
		}
		
		if (FlxG.mouse.justPressed)
		{
			state.setAnimationByName(0, "jump", false);
		}
		
		super.update(elapsed);
	}
}