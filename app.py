from PySide6.QtWidgets import QApplication, QLabel, QWidget, QVBoxLayout
import sys

app = QApplication(sys.argv)

window = QWidget()
window.setWindowTitle("Hello Docker GUI")
layout = QVBoxLayout()

label = QLabel("Hello, Docker GUI!")
layout.addWidget(label)

window.setLayout(layout)
window.resize(300, 100)
window.show()

sys.exit(app.exec())
