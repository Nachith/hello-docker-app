import sys
from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLineEdit, QPushButton, QLabel, QMessageBox

class Calculator(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Docker GUI Calculator")
        self.setGeometry(100, 100, 300, 200)

        self.layout = QVBoxLayout()

        self.num1 = QLineEdit()
        self.num1.setPlaceholderText("Enter first number")
        self.layout.addWidget(self.num1)

        self.num2 = QLineEdit()
        self.num2.setPlaceholderText("Enter second number")
        self.layout.addWidget(self.num2)

        self.result_label = QLabel("Result: ")
        self.layout.addWidget(self.result_label)

        self.add_button = QPushButton("Add")
        self.add_button.clicked.connect(self.add)
        self.layout.addWidget(self.add_button)

        self.sub_button = QPushButton("Subtract")
        self.sub_button.clicked.connect(self.subtract)
        self.layout.addWidget(self.sub_button)

        self.mul_button = QPushButton("Multiply")
        self.mul_button.clicked.connect(self.multiply)
        self.layout.addWidget(self.mul_button)

        self.div_button = QPushButton("Divide")
        self.div_button.clicked.connect(self.divide)
        self.layout.addWidget(self.div_button)

        self.setLayout(self.layout)

    def get_numbers(self):
        try:
            a = float(self.num1.text())
            b = float(self.num2.text())
            return a, b
        except ValueError:
            QMessageBox.warning(self, "Input Error", "Please enter valid numbers!")
            return None, None

    def add(self):
        a, b = self.get_numbers()
        if a is not None:
            self.result_label.setText(f"Result: {a + b}")

    def subtract(self):
        a, b = self.get_numbers()
        if a is not None:
            self.result_label.setText(f"Result: {a - b}")

    def multiply(self):
        a, b = self.get_numbers()
        if a is not None:
            self.result_label.setText(f"Result: {a * b}")

    def divide(self):
        a, b = self.get_numbers()
        if a is not None:
            if b == 0:
                QMessageBox.warning(self, "Math Error", "Cannot divide by zero!")
            else:
                self.result_label.setText(f"Result: {a / b}")


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Calculator()
    window.show()
    sys.exit(app.exec())
