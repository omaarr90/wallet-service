

public class SmsSenderImpl: SmsSender{
    func send(to: Int64, text: String) -> Result<String, Error> {
        .success("send: \(text) to \(to)")
    }
    
    func send(to: Int64, template: String, args: String...) -> Result<String, Error> {
        .success("send: \(template) to \(to) with args: \(args)")
    }
}
