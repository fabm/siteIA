package ia.nos;

import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 30/07/13
 * Time: 17:50
 * To change this template use File | Settings | File Templates.
 */
public interface No<T> {
    Iterator<No<T>> getIterador();
    T getElemento();
}
