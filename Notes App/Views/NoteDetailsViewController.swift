import UIKit

class NoteDetailsViewController: UIViewController {
    var delegate: AddNewItemDelegate?
    
    private let noteIndex: Int
    private let note: String
        
    let noteTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your note here"
        textField.borderStyle = .roundedRect
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpViews()
        setUpConstraints()
        setUpSaveButtonAction()
    }
    
    init(noteIndex: Int, note: String) {
        self.noteIndex = noteIndex
        self.note = note
        noteTextField.text = note
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            noteTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noteTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            noteTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setUpBackground() {
        view.backgroundColor = .white
    }
    
    func setUpViews() {
        view.addSubview(noteTextField)
        view.addSubview(saveButton)
    }
    
    func setUpSaveButtonAction() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        if let note = noteTextField.text, !note.isEmpty {
            delegate?.updateListItem(note: note, index: noteIndex)
            dismiss(animated: true, completion: nil)
        } else {
            print("Note field is empty")
        }
    }
}

