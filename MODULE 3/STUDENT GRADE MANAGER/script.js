
let students = [];
document.getElementById('addStudentBtn').addEventListener('click', function() {
    const name = document.getElementById('studentName').value;
    const grade = document.getElementById('studentGrade').value;

    if (name === '' || grade === '' || isNaN(grade) || grade < 0 || grade > 100) {
        alert("Please enter a valid name and grade (0-100)");
        return;
    }
    students.push({ name: name, grade: parseFloat(grade) });
    document.getElementById('studentName').value = '';
    document.getElementById('studentGrade').value = '';
});

document.getElementById('displayGradesBtn').addEventListener('click', function() {
    const gradesList = document.getElementById('gradesList');
    students.forEach(function(student, index) {
        const listItem = document.createElement('li');
        listItem.textContent =`${student.name}- ${student.grade}`;
        gradesList.appendChild(listItem);
    });
});

document.getElementById('calculateAvgBtn').addEventListener('click', function() {
    if (students.length === 0) {
        document.getElementById('averageGrade').textContent = 'N/A';
        return;
    }
    
    const total = students.reduce((sum, student) => sum + student.grade, 0);
    const average = (total / students.length);
    document.getElementById('averageGrade').textContent = average;
});