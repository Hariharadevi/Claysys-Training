document.getElementById('add-task-btn').addEventListener('click', function() {
    const taskInput = document.getElementById('new-task');
    const taskValue = taskInput.value;

    if (taskValue) {
        const li = document.createElement('li');
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';
        deleteButton.className = 'delete-btn';

        li.appendChild(checkbox);
        li.appendChild(document.createTextNode(taskValue));
        li.appendChild(deleteButton);
        document.getElementById('task-list').appendChild(li);
        taskInput.value = '';
        deleteButton.addEventListener('click', function() {
            li.remove();
        });
    }
});