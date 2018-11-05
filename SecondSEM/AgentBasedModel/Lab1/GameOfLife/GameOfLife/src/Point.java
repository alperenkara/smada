import java.util.ArrayList;

public class Point {

	public ArrayList<Point> neighbors;
	public static Integer []types ={0,1,2,3};
	public int type;
	public int staticField;
	public boolean isPedestrian;
	boolean blocked = false;	
	public Point() {
		type=0;
		staticField = 100000;
		neighbors= new ArrayList<Point>();
	}
	
	public void clear() {
		staticField = 100000;
		
	}

	public boolean calcStaticField() {
		/*!
		 *  Implement method calcStaticField(). 
		 *  If this cell staticField is larger than smallest value of naighbours staticField +1, 
		 *  set cell static field to this value. 
		 *  Return true if you change the value of staticField, otherwise return false.
		 *  */
		 if (neighbors.size()>0) {
             int min = neighbors.get(0).staticField;
             for (Point p:neighbors) {
                 if (p.staticField<min) {
                     min=p.staticField;
                 }
             }

             if (staticField>min+1){
                 staticField=min+1;
                 return true;
             }else{
                 return false;
             }

         }else {


             return false;
         }
	}
	
	public void move(){
		
		/*! Check if there is a pedestrian in given cell:
		isPedestrian == true 
		*/	    
		
		if(type ==2){
			/*! agents which are reach to exit should be removed */
	        isPedestrian = false;
	        return;
        }
		  /*! blocked == false*/ 
		  if(isPedestrian == true && blocked == false){
			  
	            if(!neighbors.isEmpty()){
	            	
	                int min = neighbors.get(0).staticField;
	                
	                int min_id = 0;
	                
	                if(neighbors.size()>1){
	                	
	                    for(int i = 0; i<neighbors.size(); i++){
	                    	
	                        if(min > neighbors.get(i).staticField){
	                        	
	                            min_id = i;
	                            
	                            min = neighbors.get(i).staticField;
	                        }
	                    }
	                }
	                isPedestrian = false;
	                neighbors.get(min_id).isPedestrian = true; /*! true */
	                neighbors.get(min_id).blocked = true;
	            }
	        }
	}

	public void addNeighbor(Point nei) {
		neighbors.add(nei);
	}
}