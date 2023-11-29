package org.proje;

import org.proje.gui.Form1;

import javax.swing.*;

public class Main {

    public static void main(String[] args) {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                Form1 f = new Form1();
                f.setVisible(true);
            }
        });

    }
}
