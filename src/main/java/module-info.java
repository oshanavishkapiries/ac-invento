module com.invento.invento {
    requires javafx.controls;
    requires javafx.fxml;
    requires lombok;
    requires java.sql;


    opens com.invento.invento.controller to javafx.fxml;
    exports com.invento.invento;
}