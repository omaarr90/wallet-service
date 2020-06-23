

public class SmsSenderImpl: SmsSender{
    func send(to: Int64, text: String) -> Result<String, Error> {
        .success(text)
    }
    
    func send(to: Int64, template: String, args: String...) -> Result<String, Error> {
        .success("fill template with args")
    }
}
