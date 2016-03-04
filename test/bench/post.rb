require_relative './bench_init'

context 'Post' do
  uri = HTTP::Commands::Controls::Messages::Requests.uri

  test 'Without Response Body' do
    request_body = HTTP::Commands::Controls::Messages::Resources.example
    expected_request, expected_response = HTTP::Commands::Controls::Dialogs::Post.example request_body
    connection = HTTP::Commands::Controls::Dialogs::Connection.example expected_request, expected_response

    response = HTTP::Commands::Post.(request_body, uri, :connection => connection)

    assert response.status_code == 201
    assert response.body.nil?
  end

  test 'With Response Body' do
    request_body = 'some-request'
    response_body = 'some-response'
    expected_request, expected_response = HTTP::Commands::Controls::Dialogs::Post.example request_body, response_body
    connection = HTTP::Commands::Controls::Dialogs::Connection.example expected_request, expected_response

    response = HTTP::Commands::Post.(request_body, uri, :connection => connection)

    assert response.status_code == 201
    assert response.body == response_body
  end

  test 'Supplying Headers' do
    headers = { 'Content-Type' => 'application/json' }

    resource = HTTP::Commands::Controls::Messages::Resources.json
    request_body = JSON.pretty_generate resource
    expected_request, expected_response = HTTP::Commands::Controls::Dialogs::Post::JSON.example resource
    connection = HTTP::Commands::Controls::Dialogs::Connection.example expected_request, expected_response

    response = HTTP::Commands::Post.(request_body, uri, headers, :connection => connection)

    assert response.status_code == 201
    assert response.body.nil?
  end

  test "Configuring" do
    receiver = OpenStruct.new

    HTTP::Commands::Post.configure receiver, :some_attr

    assert receiver.some_attr.is_a?(HTTP::Commands::Post)
  end

  test "Substitute" do
    substitute = HTTP::Commands::Post::Substitute.build

    response = substitute.()

    assert response.status_code == 201
    assert response.reason_phrase == 'Created'
    assert response.body.nil?
  end
end
