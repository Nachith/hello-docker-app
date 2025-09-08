import sys
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QVBoxLayout

class HelloWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Hello Docker GUI 🚀")
        self.setGeometry(200, 200, 300, 150)

        layout = QVBoxLayout()
        label = QLabel("Hello from PySide6 inside Docker!")
        label.setStyleSheet("font-size: 18px; font-weight: bold; color: green;")
        layout.addWidget(label)
        self.setLayout(layout)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = HelloWindow()
    window.show()
    sys.exit(app.exec())
