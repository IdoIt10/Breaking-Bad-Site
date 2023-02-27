(function () {
    var questions = [{
        question: "What percentage of purity was the meth?",
            choices: ["99.5", "89.1", "96.4", "99.1"],
        correctAnswer: 3
    }, {
        question: "What was the number of Jesse's apartment?",
            choices: ["617", "325", "545", "243"],
        correctAnswer: 1
    }, {
        question: "How Gus died?",
            choices: ["Huell killed him with his bare hands", "Mike shot him", "A bomb in Hector's bell", "Walter shot him"],
        correctAnswer: 2
    }, {
            question: "How does Walter launde his money?",
            choices: ["Car wash business", "Pizza place", "Electronic store", "Toys store"],
        correctAnswer: 0
    }, {
            question: "Under what disguise were Walter and Jesse cook in Gus's business?",
            choices: ["Laundry workers", "Insecticides", "Workers in his restaurant", "They change disguise every time"],
        correctAnswer: 0
    }, {
        question: "Who Killed Mike?",
            choices: ["Saul", "Gus", "Walter", "Huell"],
        correctAnswer: 2
    }, {
            question: "How many times Jesse said the word Bitch in the show?",
            choices: ["27", "54", "106", "91"],
        correctAnswer: 1
    }, {
            question: "Who is Huell?",
            choices: ["A co-worker with Saul as a lawyer", "Walter's friends", "Jesse's brother", "Saul Goodman's bodyguard"],
        correctAnswer: 3
    }, {
        question: "Where does Walter hide in sesson 5?",
            choices: ["In GreenLand", "In the North pole", "A cabin in New Hampshire", "In his basement"],
        correctAnswer: 2
    }, {
            question: "Was it all worth it?",
            choices: ["Yes", "No"],
        correctAnswer: 1
    }];

    var questionCounter = 0; //Tracks question number
    var selections = []; //Array containing user choices
    var quiz = $('#quiz'); //Quiz div object

    // Display initial question
    displayNext();

    // Click handler for the 'next' button
    $('#next').on('click', function (e) {
        e.preventDefault();

        // Suspend click listener during fade animation
        if (quiz.is(':animated')) {
            return false;
        }
        choose();

        // If no user selection, progress is stopped
        if (isNaN(selections[questionCounter])) {
            alert('Choose your answer');
        } else {
            questionCounter++;
            displayNext();
        }
    });

    // Click handler for the 'prev' button
    $('#prev').on('click', function (e) {
        e.preventDefault();

        if (quiz.is(':animated')) {
            return false;
        }
        choose();
        questionCounter--;
        displayNext();
    });

    // Click handler for the 'Start Over' button
    $('#start').on('click', function (e) {
        e.preventDefault();

        if (quiz.is(':animated')) {
            return false;
        }
        questionCounter = 0;
        selections = [];
        displayNext();
        $('#start').hide();
    });

    // Animates buttons on hover
    $('.button').on('mouseenter', function () {
        $(this).addClass('active');
    });
    $('.button').on('mouseleave', function () {
        $(this).removeClass('active');
    });

    // Creates and returns the div that contains the questions and 
    // the answer selections
    function createQuestionElement(index) {
        var qElement = $('<div>', {
            id: 'question'
        });

        var header = $('<h2>Question ' + (index + 1) + ':</h2>');
        qElement.append(header);

        var question = $('<p>').append(questions[index].question);
        qElement.append(question);

        var radioButtons = createRadios(index);
        qElement.append(radioButtons);

        return qElement;
    }

    // Creates a list of the answer choices as radio inputs
    function createRadios(index) {
        var radioList = $('<ul>');
        var item;
        var input = '';
        for (var i = 0; i < questions[index].choices.length; i++) {
            item = $('<li>');
            input = '<input type="radio" name="answer" value=' + i + ' />';
            input += questions[index].choices[i];
            item.append(input);
            radioList.append(item);
        }
        return radioList;
    }

    // Reads the user selection and pushes the value to an array
    function choose() {
        selections[questionCounter] = +$('input[name="answer"]:checked').val();
    }

    // Displays next requested element
    function displayNext() {
        quiz.fadeOut(function () {
            $('#question').remove();

            if (questionCounter < questions.length) {
                var nextQuestion = createQuestionElement(questionCounter);
                quiz.append(nextQuestion).fadeIn();
                if (!(isNaN(selections[questionCounter]))) {
                    $('input[value=' + selections[questionCounter] + ']').prop('checked', true);
                }

                // Controls display of 'prev' button
                if (questionCounter === 1) {
                    $('#prev').show();
                } else if (questionCounter === 0) {

                    $('#prev').hide();
                    $('#next').show();
                }
            } else {
                var scoreElem = displayScore();
                quiz.append(scoreElem).fadeIn();
                $('#next').hide();
                $('#prev').hide();
                $('#start').show();
            }
        });
    }

    // Computes score and returns a paragraph element to be displayed
    function displayScore() {
        var score = $('<p>', { id: 'question' });

        var numCorrect = 0;
        for (var i = 0; i < selections.length; i++) {
            if (selections[i] === questions[i].correctAnswer) {
                numCorrect++;
            }
        }
        score.append('You got ' + numCorrect + ' questions out of ' +
            questions.length + ' right. ');
        if (numCorrect > 5 && numCorrect != 10)
            score.append('Well done!');
        if (numCorrect <= 5)
            score.append('Nice, next time you will do better');
        if (numCorrect == 10)
            score.append('Wow! You are the Master!');
        return score;
    }
})();