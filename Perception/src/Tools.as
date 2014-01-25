package  
{
	/**
	 * ...
	 * @author Steven
	 */
	public class Tools 
	{
		
		public static function getRandomBetween(min, max):Number
		{
			var answer:Number = Math.floor((Math.random() * (max - min + 1))) + min;
			return answer;
		}
	}

}