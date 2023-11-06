import UIKit

class NoteListViewController: UIViewController {
    
    public var notes: [String] = ["Test1", "Test2", "Test3"]
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNavigationBar()
    }
    
    private func setUpTableView() {
        initTableView()
        setTableViewConstraints()
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "Notes 📝"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.delegate = self
        let navigationController = UINavigationController(rootViewController: addNoteVC)
        present(navigationController, animated: true)
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = note
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        let noteDetailsVC = NoteDetailsViewController(noteIndex: indexPath.row, note: note)
        noteDetailsVC.delegate = self
        let navigationController = UINavigationController(rootViewController: noteDetailsVC)
        present(navigationController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, boolValue) in
            self.notes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeActions
    }
    
}

extension NoteListViewController: AddNewItemDelegate {
    func updateListItem(note: String, index: Int) {
        guard index >= 0 && index < notes.count else { return }
        notes[index] = note
        tableView.reloadData()
    }
    
    func addItemToList(note: String) {
        notes.append(note)
        tableView.reloadData()
    }
}

