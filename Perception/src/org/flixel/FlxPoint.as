package org.flixel
{
   import org.flixel.FlxDegrees;
   import org.flixel.FlxRadians;

   /**
    * Stores a 2D floating point coordinate.
    */
   public class FlxPoint
   {
      /**
       * @default 0
       */
      public var x:Number;
      /**
       * @default 0
       */
      public var y:Number;
      
      /**
       * Instantiate a new point object.
       * 
       * @param   X      The X-coordinate of the point in space.
       * @param   Y      The Y-coordinate of the point in space.
       */
      public function FlxPoint( arg0:Number=0, arg1:Object=null ) {
          if( arg1 is Number ) create_from_points( arg0, Number(arg1) );
          else if( arg1 is int ) create_from_points( arg0, int( arg1 ) );
          else if( arg1 == null ) create_from_points( 0,0 );
          else if( arg1 is FlxRadians ) create_from_FlxRadians( arg0, FlxRadians(arg1) );
          else create_from_FlxDegrees( arg0, FlxDegrees(arg1) );
      } 
      public function create_from_points( xx:Number, yy:Number ):void {
         x = xx;
         y = yy;
      }
      public function create_from_FlxRadians( mag:Number, rad:FlxRadians ):void {
         x = mag * Math.cos( rad.value );
         y = mag * Math.sin( rad.value );
      }
      public function create_from_FlxDegrees( mag:Number, deg:FlxDegrees ):void {
         x = mag * Math.cos( deg.to_radians().value );
         y = mag * Math.sin( deg.to_radians().value );
      }
      
      
      // Math Operations on FlxPoint's
      public function v_add( v2:FlxPoint ):FlxPoint { return new FlxPoint( this.x + v2.x, this.y + v2.y ); }
      public function v_sub( v2:FlxPoint ):FlxPoint { return new FlxPoint( this.x - v2.x, this.y - v2.y ); }
      public function v_mul( v2:FlxPoint ):FlxPoint { return new FlxPoint( this.x * v2.x, this.y * v2.y ); }
      public function v_div( v2:FlxPoint ):FlxPoint { return new FlxPoint( this.x / v2.x, this.y / v2.y ); }
      public function v_mod( v2:FlxPoint ):FlxPoint { return new FlxPoint( this.x % v2.x, this.y % v2.y ); }
      
      // Scalar Math Operations
      public function s_add( s:Number ):FlxPoint { return new FlxPoint( this.x + s, this.y + s ); }
      public function s_sub( s:Number ):FlxPoint { return new FlxPoint( this.x - s, this.y - s ); }
      public function s_mul( s:Number ):FlxPoint { return new FlxPoint( this.x * s, this.y * s ); }
      public function s_div( s:Number ):FlxPoint { return new FlxPoint( this.x / s, this.y / s ); }
      public function s_mod( s:Number ):FlxPoint { return new FlxPoint( this.x % s, this.y % s ); }
      
      // Returns a new FlxPoint containing the floor of this FlxPoint      
      public function floor():FlxPoint {
         return new FlxPoint( Math.floor(x), Math.floor(y) );
      }
      
      // Returns a new FlxPoint containing the ceil of this FlxPoint
      public function ceil():FlxPoint {
         return new FlxPoint( Math.ceil(x), Math.ceil(y) );
      }
      
      // Returns the radians angle of this point (considered a vector)
      public function radians():Number { 
         return Math.atan2( y, x ); 
      }
      
      // Returns a copy of the FlxPoint
      public function copy():FlxPoint {
         return new FlxPoint( x,y );
      }
      
      // Return a new FlxPoint containing the abs of this FlxPoint
      public function abs():FlxPoint {
         return new FlxPoint( Math.abs(x), Math.abs(y) );
      }
      
      // Returns "(x,y)"
      public function print():String {
         return new String( "(" + x + "," + y + ")" );
      }
      
      // Geturns the degrees angle of this point (considered a vector)
      public function degrees():Number { 
         return new FlxRadians( Math.atan2( y, x ) ).to_degrees().value; 
      }
      
      // Get the FlxPoint at same angle with a magnitue of 1
      public function normalized():FlxPoint { 
         return new FlxPoint( 1.0, new FlxRadians( this.radians() ) ); 
      }
      
      // Dot product with another FlxPoint
      public function dot( v2:FlxPoint ):Number { 
         return this.x*v2.x + this.y*v2.y; 
      }
      
      // Cross Product with another FlxPoint
      public function cross( v2:FlxPoint ):Number { 
         return (this.x*v2.y - this.y*v2.x); 
      }
      
      // Project this FlxPoint onto a FlxLine
      // Returns the FlxPoint on the FlxLine
    
      // Distance to another FlxPoint
      public function distance_to( other:FlxPoint ):Number {
         return (other.v_sub(this)).magnitude(); 
      }
      
      // Magnitude of this FlxPoint
      public function magnitude():Number { 
         return Math.sqrt( x * x + y * y ); 
      }
	  
		public function make(X:Number=0, Y:Number=0):FlxPoint
		{
			x = X;
			y = Y;
			return this;
		}

      
      // Clamps FlxPoint onto a line
     
      
      // Normal of the FlxPoint
      public function normal():FlxPoint { 
         return new FlxPoint( -y, x ); 
      }
      
      /**
       * Convert object to readable string name.  Useful for debugging, save games, etc.
       */
      public function toString():String
      {
         return FlxU.getClassName(this,true);
      }
   }
}


