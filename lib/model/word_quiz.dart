class WordQuiz {
  final String? question;
  final String? answer;
  final String? option1;
  final String? option2;

  WordQuiz({
    this.question,
    this.answer,
    this.option1,
    this.option2,
  });
}

List<WordQuiz> questions = [
  WordQuiz(
      question: 'Which word is similar to cold-blooded?',
      option1: 'Cruel',
      option2: 'Genial',
      answer: 'Cruel'),
  WordQuiz(
      question: 'Which word is similar to lucre?',
      option1: 'Cash',
      option2: 'Calm',
      answer: 'Cash'),
  WordQuiz(
      question: 'Which word is the opposite of humble?',
      option1: 'Timid',
      option2: 'Proud',
      answer: 'Proud'),
  WordQuiz(
      question: 'Which word is similar to grubby?',
      option1: 'Grumsy',
      option2: 'Dirty',
      answer: 'Dirty'),
  WordQuiz(
      question: 'Which word is opposite of grubby?',
      option1: 'Clean',
      option2: 'Canny',
      answer: 'Clean'),
  WordQuiz(
      question: 'Which word is similar to ancestry?',
      option1: 'Lineage',
      option2: 'Collage',
      answer: 'Lineage'),
];
