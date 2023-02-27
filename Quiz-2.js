(function () {
    var questions = [{
        question: "What does Walter threw on the roof?",
        choices: ["A pizza", "A shoe", "A ball", "A doll"],
        correctAnswer: 0
    }, {
        question: "What is the nick-names of Jesse's friends?",
            choices: ["Big Pete and little joey", "Skinny Pete and Badger", "30 cent and Joe the black", "Shaq and Big daddy"],
        correctAnswer: 1
    }, {
        question: "What is the name of the company that Walter helped creating?",
            choices: ["UnI Inc.", "Omega Corp", "Grey Matter", "One"],
        correctAnswer: 2
    }, {
        question: "What is the names of Walter's old friends from work?",
            choices: ["Mike and Tommy Keen", "Monica and Josh Green", "Emma and David Schwartz ", "Gretchen and Elliott Schwartz"],
        correctAnswer: 3
    }, {
        question: "How Jesse's girlfriend died?",
            choices: ["Overdose", "Natural causes", "Died from a gun shot", "Suffocated from her own vomit"],
        correctAnswer: 3
    }, {
        question: "What is the name of the replacer of walter?",
            choices: ["Mike", "Gail", "Gordon", "Ivar"],
        correctAnswer: 1
    }, {
        question: "what is the name of the crippled with the bell?",
            choices: ["Hector", "Francis", "Oldi", "Floki"],
        correctAnswer: 0
    }, {
        question: "In which season does Hank found out who is Heisenberg?",
            choices: ["Seasson 2", "Seasson 4", "Seasson 1", "Seasson 5"],
        correctAnswer: 3
    }, {
        question: "How old was Walter at the end of the show?",
            choices: ["51", "52", "50", "53"],
        correctAnswer: 1
    }, {
        question: "Who killed Gus?",
            choices: ["Mike", "Jesse", "Hector", "Walter"],
        correctAnswer: 2
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
            score.append('Wow! You are ready for the next level!');
        return score;
    }
})();