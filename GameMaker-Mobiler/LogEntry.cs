namespace GameMaker_Mobiler;

public enum LogLevel
{
    Info,
    Warning,
    Error
}

public sealed record LogEntry(string Message, LogLevel Level);
