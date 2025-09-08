from PySide6.QtWidgets import QApplication, QLabel, QWidget, QVBoxLayout
import sys

app = QApplication(sys.argv)

window = QWidget()
window.setWindowTitle("Hello Docker GUI")
layout = QVBoxLayout()

label = QLabel("Hello, Docker GUI via Browser!")
layout.addWidget(label)

window.setLayout(layout)
window.resize(400, 150)
window.show()

sys.exit(app.exec())
