defmodule Mastery do
  alias Mastery.Boundary.{QuizSession, QuizManager}
  alias Mastery.Boundary.{TemplateValidator, QuizValidator}
  alias Mastery.Core.Quiz

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- QuizManager.build_quiz(fields) do
      :ok
    end
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- QuizManager.add_template(title, fields) do
      :ok
    end
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_quiz_by_title(title),
         {:ok, _} <- QuizSession.take_quiz(quiz, email) do
      {title, email}
    end
  end

  def select_question(session) do
    QuizSession.select_question(session)
  end

  def answer_question(session, answer) do
    QuizSession.answer_question(session, answer)
  end
end
