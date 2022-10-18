package com.example.justjava;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import java.text.NumberFormat;

public class MainActivity extends AppCompatActivity
{
    int quantity = 2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    private int calculateprice(boolean haswhippedcream,boolean chocolate)
    {

        int price=quantity*10;
        if(haswhippedcream)
            price+=1*quantity;
        if(chocolate)
            price+=2*quantity;
        return price;
    }

     public void submitOrder(View view) {
         CheckBox whippedCreamCheckBox=(CheckBox)findViewById(R.id.whipped_cream_checkbox);
         CheckBox chocolateCheckBox=(CheckBox)findViewById(R.id.chocolate_checkbox);
         EditText Name=(EditText) findViewById(R.id.name);
         String value=Name.getText().toString();
         boolean haswhippedcream=whippedCreamCheckBox.isChecked();
         boolean chocolate=chocolateCheckBox.isChecked();
        int price = calculateprice(haswhippedcream,chocolate);
        String PriceMessage = createordersummary(price,value,haswhippedcream,chocolate);
         Intent intent = new Intent(Intent.ACTION_SENDTO);
         intent.setData(Uri.parse("mailto:")); // only email apps should handle this
         intent.putExtra(Intent.EXTRA_SUBJECT, value+"'s order for JustJava App");
         if (intent.resolveActivity(getPackageManager()) != null) {
             startActivity(intent);
         }
         displayMessage(PriceMessage);
    }
    private String createordersummary(int price,String Name,boolean haswhippedcream,boolean chocolate)
    {
        String orderMessage=getString(R.string.order_summary,Name);
        orderMessage+="\nQuantity:"+quantity;
        orderMessage+="\nAdd whipped cream?"+haswhippedcream;
        orderMessage+="\nAdd chocolate?"+chocolate;
        orderMessage+="\nTotal:"+price+" $";
        orderMessage+="\n"+getString(R.string.thank_you);
        return orderMessage;
    }
     public void increment(View view) {
        if(quantity==100)
        {
            return;
        }
        quantity += 1;
        display(quantity);
    }

    public void decrement(View view) {
        if(quantity==0)
        {
            return;
        }
        quantity -= 1;
        display(quantity);
    }

    private void display(int number) {
        TextView quantityTextview = (TextView)findViewById(R.id.textView);
        quantityTextview.setText("" + number);
    }
    /**
     * This method displays the given price on the screen.
     */
    private void displayPrice(int number) {
        TextView priceTextView = (TextView) findViewById(R.id.price);
        priceTextView.setText(NumberFormat.getCurrencyInstance().format(number));
    }

    /**
     * This method displays the given text on the screen.
     */
    private void displayMessage(String message) {
        TextView priceTextView = (TextView)findViewById(R.id.price);
        priceTextView.setText(message);
    }
}