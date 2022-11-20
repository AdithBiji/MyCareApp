package mycare;

import java.util.ArrayList;
import java.util.Scanner;

public class BusinessLogic {
	public static void main(String[] args) {
		
		
		int lockSize=0;
		
		
		Scanner scan = new Scanner(System.in);
		System.out.println("Member :");
		int mem=scan.nextInt();
		System.out.println("Participate :");
		int part=scan.nextInt();
		
		for(int i=0; i<=49; i++){
			
			if(mem%50==0)
				break;
			else{
				lockSize++;
				mem++;
			}
				
			
			
		}
		System.out.println("members "+mem);
		System.out.println("lock size "+lockSize);
		
		
		if(part<0){
			ArrayList lock = new ArrayList(lockSize);
			
		}
		

	}
}
