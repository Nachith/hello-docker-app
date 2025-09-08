import sys
from PySide6.QtWidgets import QApplication, QWidget, QLabel, QPushButton, QVBoxLayout,QGridLayout


app = QApplication(sys.argv)

window = QWidget()
window.setWindowTitle("Simple Pyside6 App")

layout = QGridLayout()
label = QLabel("Hello, PySide6!")
layout.addWidget(label, 0, 0)

button = QPushButton("Click Me")
layout.addWidget(button, 1, 0)

window.setLayout(layout)
window.show()
window.showMaximized()

sys.exit(app.exec())