package br.com.pucminas.android.transportadoraabc;

import org.junit.Test;

import static org.junit.Assert.*;

public class MainActivityTest {

    @Test
    public void testCase01() {
        assertEquals(22.0,MainActivity.calculateCredits(10.0,10.0),0.01);
    }

    @Test
    public void testCase02() {
        assertEquals(110.0,MainActivity.calculateCredits(5.0,100.0),0.01);
    }
}