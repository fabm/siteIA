package ia.procura.procuraLargura;

import ia.nos.No;
import ia.procura.Cidade;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 05/08/13
 * Time: 15:26
 * To change this template use File | Settings | File Templates.
 */
public class CidadePL extends Cidade<CidadePL> implements Comparable<CidadePL> {
    public CidadePL(String nome, int distancia) {
        init(nome);
        this.distancia = distancia;
    }

    public int getDistancia() {
        return distancia;
    }

    private int distancia;

    public int getIteracao() {
        return iteracao;
    }


    private int iteracao;

    void setIteracao(int iteracao) {
        this.iteracao = iteracao;
    }
    ArrayList<No<CidadePL>> getFCidades() {
        return cidades;
    }

    public CidadePL add(String nome, int distancia) {
        CidadePL nova = new CidadePL(nome, distancia);
        getCidades().add(nova);
        return nova;
    }

    public void add(CidadePL cidade, int distancia) {
        CidadePL copia = new CidadePL(cidade.getNome(), distancia);
        copia.cidades = cidade.cidades;
        this.getCidades().add(copia);
    }

    public CidadePL copia(){
        CidadePL copia = new CidadePL(this.getNome(),this.getDistancia());
        if(this.cidades==null)return copia;

        for (No<CidadePL> c : this.cidades) {
            copia.getCidades().add(c.getElemento().copia());
        }
        return copia;
    }

    @Override
    public int compareTo(CidadePL o) {
        if (this.distancia < o.distancia) return -1;
        if (this.distancia > o.distancia) return 1;
        return 0;
    }


    @Override
    public CidadePL getElemento() {
        return this;
    }
}
