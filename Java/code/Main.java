package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Properties;
import java.util.Scanner;

public class Main   {

    public static void main(String[] args) {

            boolean Flage=false;
            Properties  Input =new Properties();
        for(int CounterA=0;CounterA<6;CounterA +=2)
             {
                 Scanner Scan = new Scanner(System.in);
                 String InputA;
                 String Inputc;
                 int InputB = 0;
                 while(true)
                     {
                         System.out.println("Input String: ");
                         InputA = Scan.next();
                         /*Check the input length*/
                        if(InputA.length()<=10){break;}
                            else
                                {System.out.print("re");Flage=false;}
                     }

                 while(true)
                     {
                         System.out.println("Input  Integer: ");
                          try
                             {
                                 InputB = Scan.nextInt(  );
                                 Flage=false;
                             }
                             catch (Exception e)
                             {
                                 /*Check the input type*/
                                 Flage=true; System.out.println(" ");
                                 Inputc = Scan.next();
                             }
                             /*Check the input length*/
                             if(InputB<= 999 && InputB>=0 && (Flage==false))
                                 {break;}
                             else
                                 {System.out.print("re");}
                     }
            /* Insert input in Properties */

            Input.put(String.valueOf(CounterA),InputA);
            Input.put(String.valueOf(CounterA+1),String.valueOf(InputB));

        }

        try(FileOutputStream Output = new FileOutputStream("save. Properties"); )
            {
                /* store input in Properties */
                Input.store(Output,null);
                for(int CounterA=0;CounterA<6;CounterA +=2)
                    {
                        /* read input from Properties and write  */
                        System.out.printf("%-15s%03d\n",
                                Input.getProperty(String.valueOf(CounterA)),
                                Integer.valueOf(Input.getProperty(String.valueOf(CounterA+1))));
                    }
            }
        catch(Exception e)
        {System.out.println("  "+e );}

    }
}
