package cursoandroid.app.com.jogo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    //------------------------------------------------------------------------//
    public void selecionadoPedra(View view){
        this.opcaoSelecionada("pedra");
    }
    public void selecionadoPapel(View view){
        this.opcaoSelecionada("papel");
    }
    public void selecionadoTesoura(View view){
        this.opcaoSelecionada("tesoura");
    }
    //------------------------------------------------------------------------//

    //------------------------------------------------------------------------//
    public void opcaoSelecionada(String escolhaUsuario){
        ImageView imagemResultado = findViewById(R.id.imageResultado);
        TextView textoResultado = findViewById(R.id.textResultado);

        int numero = new Random().nextInt(3); //0 1 2
        String[] opcoes = {"pedra" , "papel" , "tesoura"};
        String escolhaApp = opcoes [ numero ];
        //------------------------------------------------------------------------//


        //------------------------------------------------------------------------//
        switch ( escolhaApp ){
            case "pedra" :
                    imagemResultado.setImageResource(R.drawable.pedra);
                    break;

            case "papel" :
                    imagemResultado.setImageResource(R.drawable.papel);
                    break;
            case "tesoura" :
                    imagemResultado.setImageResource(R.drawable.tesoura);
                    break;
        }
        //------------------------------------------------------------------------//

        //app ganhador
        if (
                        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
                        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
                        (escolhaApp == "pedra" && escolhaUsuario == "tesoura")
        ){
            textoResultado.setText("Você perdeu :( ");

            //Usuario ganhador
        }else if (
                        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
                        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
                        (escolhaUsuario == "pedra" && escolhaApp == "tesoura")
        ){
            textoResultado.setText("Você ganhou :) ");

            //empate
        }else{
            textoResultado.setText("Empatamos ;)");
        }


    }

}