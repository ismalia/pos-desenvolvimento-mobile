package br.com.pucminas.android.transportadoraabc;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText kmDistanceEditText;
    EditText fuelLiterPriceEditText;
    TextView relatoryTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        kmDistanceEditText = findViewById(R.id.kmDistanceEditText);
        fuelLiterPriceEditText = findViewById(R.id.fuelLiterPriceEditText);
        relatoryTextView = findViewById(R.id.relatoryTextView);
    }

    public void showCredits(View view) {
        double kmDistance = Double.parseDouble(kmDistanceEditText.getText().toString());
        double fuelLiterPrice = Double.parseDouble(fuelLiterPriceEditText.getText().toString());

        double credits = calculateCredits(kmDistance, fuelLiterPrice);
        relatoryTextView.setText(String.format("Crédito necessário: R$ %.2f", credits));
    }

    public static double calculateCredits(double kmDistance, double fuelLiterPrice) {
        double averageConsumption = 10.0; //km/l
        double safetyMargin = 1.10; //10%

        double credits = fuelLiterPrice / averageConsumption * kmDistance * safetyMargin * 2;

        return credits;
    }
}