package ia.nos;

import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 30/07/13
 * Time: 18:11
 * To change this template use File | Settings | File Templates.
 */
public class LeitorHierarquico<T> {
    public final static int INICIO_NO = 0, FIM_NO = 1, FIM_ITERADOR = 2, NO_VAZIO = 3;
    private LinkedList<Iterator<? extends No<T>>> pilha = new LinkedList<Iterator<? extends No<T>>>();
    private int estado;

    public LeitorHierarquico(No<T> raiz) {
        pilha.push(Arrays.asList(raiz).iterator());
        estado = LeitorHierarquico.INICIO_NO;
    }


    public No<T> proximo() {
        if (pilha.isEmpty()) {
            estado = FIM_ITERADOR;
            return null;
        }
        Iterator<? extends No<T>> _iterador = pilha.getFirst();
        No<T> _no = null;

        if (_iterador == null) {
            pilha.removeFirst();
            _iterador = pilha.getFirst();
        }

        if (_iterador.hasNext()) {
            _no = _iterador.next();
            _iterador = _no.getIterador();
            pilha.push(_iterador);
            if (_iterador == null) {
                estado = NO_VAZIO;
                return _no;
            } else {
                estado = INICIO_NO;
                return _no;
            }
        } else if (!pilha.isEmpty()) {
            pilha.removeFirst();
            estado = FIM_NO;
            return null;
        } else {
            estado = FIM_ITERADOR;
            return null;
        }
    }

    public int getNivel() {
        return pilha.size() - 1;
    }

    public boolean isInicioNo() {
        return estado == NO_VAZIO || estado == INICIO_NO;
    }

    public boolean isInicioNoSemFilhos() {
        return estado == NO_VAZIO;
    }

    public boolean isInicioNoComFilhos() {
        return estado == INICIO_NO;
    }

    public boolean isFimNo() {
        return estado == FIM_NO;
    }

    public boolean isFimIterador() {
        return estado == FIM_ITERADOR;
    }
}