codeunit 50100 MessageHandling
{
    trigger OnRun()
    begin
        SimpleMessage();
        ComplexMessage();
    end;

    local procedure SimpleMessage()
    begin
        Message('You can see this simple message');
    end;

    local procedure ComplexMessage()
    begin
        Message('You can see this complex message ')
    end;

    [EventSubscriber(ObjectType::Page, Page::Nationality, 'OnBeforeToggleCitizenship', '', false, false)]
    local procedure NotifyCitizenshipToggle(var Citizens: Record Citizens)
    begin
        Citizens.FindFirst();
        Citizens.Employed := true;
        Citizens.Modify(true);
    end;

    [EventSubscriber(ObjectType::Page, Page::Nationality, 'OnAfterToggleCitizenship', '', false, false)]
    local procedure NotifyCitizenshipToggled(var Citizens: Record Citizens)
    begin
        Citizens.Findlast();
        Citizens.Employed := true;
        Citizens.Modify(true);
    end;
}