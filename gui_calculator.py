from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLineEdit, QPushButton, QLabel, QMessageBox
import sys

class Calculator(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Docker GUI Calculator")
        self.layout = QVBoxLayout()
        
        self.input_field = QLineEdit()
        self.layout.addWidget(QLabel("Enter expression:"))
        self.layout.addWidget(self.input_field)
        
        self.calc_button = QPushButton("Calculate")
        self.calc_button.clicked.connect(self.calculate)
        self.layout.addWidget(self.calc_button)
        
        self.result_label = QLabel("")
        self.layout.addWidget(self.result_label)
        
        self.setLayout(self.layout)
        
    def calculate(self):
        expr = self.input_field.text()
        try:
            result = eval(expr)
            self.result_label.setText(f"Result: {result}")
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Invalid expression: {e}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Calculator()
    window.show()
    sys.exit(app.exec())
